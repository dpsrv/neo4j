# Neo4j Kubernetes Deployment

## Prerequisites

Requires secret `neo4j-auth` in namespace `dpsrv` with key `NEO4J_AUTH` set to `neo4j/<password>`.

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

## Configuration

Memory settings in `k8s/01-neo4j-configmap.yaml`:
- Heap: 512MB initial, 1GB max
- Page cache: 512MB

Adjust based on your data size and workload.
