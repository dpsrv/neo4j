# Neo4j Kubernetes Deployment

## Prerequisites

Requires secret `neo4j-auth` in namespace `dpsrv` with key `neo4j-auth` set to `neo4j/<password>`.

```bash
kubectl create secret generic neo4j-auth -n dpsrv --from-literal=neo4j-auth='neo4j/yourpassword'
```

## Deploy

```bash
./k8s/apply.sh
```

## Port Forward (localhost only)

```bash
# Browser UI
kubectl port-forward -n dpsrv svc/neo4j 7474:7474 --address 127.0.0.1

# Bolt protocol (for drivers)
kubectl port-forward -n dpsrv svc/neo4j 7687:7687 --address 127.0.0.1

# Both at once
kubectl port-forward -n dpsrv svc/neo4j 7474:7474 7687:7687 --address 127.0.0.1
```

## Usage

### Browser UI

Open http://localhost:7474 and login with:
- Username: `neo4j`
- Password: (from secret `neo4j-auth`)

### Cypher Shell

```bash
# Interactive shell
./bin/cypher-shell.sh

# Run a query
./bin/cypher-shell.sh "MATCH (n) RETURN count(n);"
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
bolt://neo4j.dpsrv.svc.cluster.local:7687
http://neo4j.dpsrv.svc.cluster.local:7474
```

## Wikidata Import

Download the truthy dump from https://dumps.wikimedia.org/wikidatawiki/entities/ (latest-truthy.nt.gz).

### Setup

```bash
# Create wikidata user (uses admin credentials from neo4j-auth secret)
./bin/setup-wikidata-db.sh 'wikidata-password'

# Create the secret for the wikidata user
kubectl create secret generic neo4j-wikidata-auth -n dpsrv --from-literal=neo4j-wikidata-auth='wikidata/wikidata-password'
```

### Import

```bash
./bin/import-wikidata.sh ~/downloads/latest-truthy.nt.gz
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
