# Neo4j Kubernetes Deployment

## Prerequisites

Create secrets for each environment:

```bash
# Admin credentials (format: neo4j/<password>)
kubectl create secret generic neo4j-auth-dev -n dpsrv --from-literal=neo4j-auth-dev='neo4j/yourpassword'
kubectl create secret generic neo4j-auth-prod -n dpsrv --from-literal=neo4j-auth-prod='neo4j/yourpassword'

# Wikidata user credentials (format: wikidata/<password>)
kubectl create secret generic neo4j-wikidata-auth-dev -n dpsrv --from-literal=neo4j-wikidata-auth-dev='wikidata/yourpassword'
kubectl create secret generic neo4j-wikidata-auth-prod -n dpsrv --from-literal=neo4j-wikidata-auth-prod='wikidata/yourpassword'
```

## Deploy

```bash
./k8s/apply.sh
```

## Port Forward (localhost only)

```bash
# Prod
kubectl port-forward -n dpsrv svc/neo4j-prod 7474:7474 7687:7687 --address 127.0.0.1

# Dev (use different local ports)
kubectl port-forward -n dpsrv svc/neo4j-dev 17474:7474 17687:7687 --address 127.0.0.1
```

Then open http://localhost:7474 (prod) or http://localhost:17474 (dev) in your browser.

## Usage

### Browser UI

Open http://localhost:7474 and login with:
- Username: `neo4j`
- Password: `kubectl get secret neo4j-prod-auth -n dpsrv -o jsonpath='{.data.neo4j-prod-auth}' | base64 -d | cut -d/ -f2`

### Neo4j Desktop

Download from https://neo4j.com/download/ - connect to `bolt://localhost:7687` with the same credentials.

### Cypher Shell

```bash
# Interactive shell (first arg is env: dev or prod)
./bin/cypher-shell.sh dev
./bin/cypher-shell.sh prod

# Run a query
./bin/cypher-shell.sh dev "MATCH (n) RETURN count(n);"
```

### Python

```python
from neo4j import GraphDatabase

driver = GraphDatabase.driver(
    "bolt://localhost:7687",
    auth=("neo4j", "changeme")
)

with driver.session() as session:
    result = session.run("MATCH (n) RETURN count(n) AS count")
    print(result.single()["count"])
```

### Node.js

```javascript
const neo4j = require('neo4j-driver');

const driver = neo4j.driver(
  'bolt://localhost:7687',
  neo4j.auth.basic('neo4j', 'changeme')
);

const session = driver.session();
const result = await session.run('MATCH (n) RETURN count(n) AS count');
console.log(result.records[0].get('count').toNumber());
```

## In-cluster access

```
# Prod
bolt://neo4j-prod.dpsrv.svc.cluster.local:7687
http://neo4j-prod.dpsrv.svc.cluster.local:7474

# Dev
bolt://neo4j-dev.dpsrv.svc.cluster.local:7687
http://neo4j-dev.dpsrv.svc.cluster.local:7474
```

## Wikidata Import

Download the truthy dump from https://dumps.wikimedia.org/wikidatawiki/entities/ (latest-truthy.nt.gz).

### Setup

```bash
# Create wikidata user (uses credentials from neo4j-wikidata-auth-<env> secret)
./bin/setup-wikidata-db.sh dev
./bin/setup-wikidata-db.sh prod
```

### Filter (optional)

Filter the dump to extract only relevant triples (classes, geography, languages):

```bash
./bin/filter-wikidata.js ~/downloads/latest-truthy.nt ~/downloads/filtered-truthy.nt
```

### Import

```bash
# First arg is env, second is path to .nt.gz file
./bin/import-wikidata.sh dev ~/downloads/filtered-truthy.nt.gz
./bin/import-wikidata.sh prod ~/downloads/filtered-truthy.nt.gz
```

### Property Labels

Fetch human-readable labels for property predicates:

```bash
./bin/import-property-labels.js dev
./bin/import-property-labels.js prod
```

### Example Queries

```cypher
// Find an entity by Wikidata ID (e.g., Q42 = Douglas Adams)
MATCH (n:Resource {uri: 'http://www.wikidata.org/entity/Q42'})
RETURN n;

// Get all properties of an entity
MATCH (n:Resource {uri: 'http://www.wikidata.org/entity/Q42'})-[r]->(m)
RETURN type(r) AS property, m.uri AS value, m.value AS literal
LIMIT 50;

// Find entities by label (if imported)
MATCH (n:Resource)
WHERE n.`http://www.w3.org/2000/01/rdf-schema#label` CONTAINS 'Albert Einstein'
RETURN n.uri, n.`http://www.w3.org/2000/01/rdf-schema#label`
LIMIT 10;

// Find all instances of a class (e.g., Q5 = human)
MATCH (n:Resource)-[:ns0__P31]->(class:Resource {uri: 'http://www.wikidata.org/entity/Q5'})
RETURN n.uri LIMIT 10;

// Explore relationships between two entities
MATCH path = (a:Resource {uri: 'http://www.wikidata.org/entity/Q42'})-[*1..2]-(b:Resource {uri: 'http://www.wikidata.org/entity/Q84'})
RETURN path LIMIT 5;

// Count entities
MATCH (n:Resource) WHERE n.uri STARTS WITH 'http://www.wikidata.org/entity/Q'
RETURN count(n) AS entities;
```

## Configuration

Memory settings in `k8s/01-neo4j-configmap.yaml`:
- Heap: 512MB initial, 1GB max
- Page cache: 512MB

Adjust based on your data size and workload. For Wikidata imports, increase significantly:
- Heap: 4GB+
- Page cache: 8GB+
