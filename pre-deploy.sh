#!/bin/bash
BACKUP_DIR="./backup/meta_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"
for id in 1 2 3; do
  docker cp kafka-$id:/var/lib/kafka/data/meta.properties $BACKUP_DIR/meta-kafka-$id.properties
done
grep cluster.id $BACKUP_DIR/meta-*.properties
