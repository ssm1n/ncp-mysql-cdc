#!/bin/bash
# =====================================
# Kafka meta.properties Backup Script
# =====================================

BACKUP_DIR="./backup/meta_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "Backing up meta.properties files to: $BACKUP_DIR"

for id in 1 2 3; do
  CONTAINER="kafka-$id"
  FILE_PATH="/var/lib/kafka/data/meta.properties"

  echo "→ Checking $CONTAINER..."
  if docker exec $CONTAINER test -f "$FILE_PATH"; then
    docker cp $CONTAINER:$FILE_PATH $BACKUP_DIR/meta-kafka-$id.properties
    echo "Backed up $CONTAINER"
  else
    echo "$CONTAINER has no meta.properties (container not initialized?)"
  fi
done

echo
echo "Cluster IDs in backup:"
grep cluster.id $BACKUP_DIR/meta-*.properties || echo "No cluster.id found."

echo
echo "Comparing cluster.id consistency:"
grep cluster.id $BACKUP_DIR/meta-*.properties | awk -F'=' '{print $2}' | uniq -c
echo
echo "Backup completed at $(date)"
