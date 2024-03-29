curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d '{
        "name": "postgres-sink",
        "config": {
                "tasks.max": "1",
                "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
                "connection.url": "jdbc:postgresql://postgres:5432/kafka_connect",
                "connection.user": "kafka_connect",
                "connection.password": "kafka_connect",
                "auto.create": "true",
                "auto.evolve": "true",
                "errors.tolerance": "all",
                "errors.deadletterqueue.topic.name": "jdbc_deadletterqueue",
                "errors.deadletterqueue.topic.replication.factor": "1",
                "pk.mode": "record_value",
                "pk.fields": "postgres_pk",
                "insert.mode": "upsert",
                "topics.regex": ".*?persist"
                }
        }'

curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d '{
        "name": "transaction_data_source",
        "config": {
                "tasks.max": "1",
                "connector.class": "com.github.jcustenborder.kafka.connect.spooldir.SpoolDirCsvSourceConnector",
                "input.path": "/home/data",
                "error.path": "/home/data/error",
                "finished.path": "/home/data/finished",
                "halt.on.error": "false",
                "errors.tolerance": "all",
                "errors.deadletterqueue.topic.name": "csv_deadletterqueue",
                "errors.deadletterqueue.topic.replication.factor": "1",
                "empty.poll.wait.ms": "3000",
                "csv.first.row.as.header": "true",
                "schema.generation.enabled": "true",
                "csv.null.field.indicator": "EMPTY_SEPARATORS",
                "csv.separator.char": "59",
                "input.file.pattern": ".*?transaction_data.*?\\.csv",
                "topic": "transaction_data"
                }
        }'
        # TODO: schema.generation.enabled: false
        # "key.schema": "",
        # "value.schema": "",

curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d '{
        "name": "adobe_analytics_source",
        "config": {
                "tasks.max": "1",
                "connector.class": "com.github.jcustenborder.kafka.connect.spooldir.SpoolDirCsvSourceConnector",
                "input.path": "/home/data",
                "error.path": "/home/data/error",
                "finished.path": "/home/data/finished",
                "halt.on.error": "false",
                "errors.tolerance": "all",
                "errors.deadletterqueue.topic.name": "csv_deadletterqueue",
                "errors.deadletterqueue.topic.replication.factor": "1",
                "empty.poll.wait.ms": "3000",
                "csv.first.row.as.header": "true",
                "schema.generation.enabled": "true",
                "csv.null.field.indicator": "EMPTY_SEPARATORS",
                "csv.separator.char": "59",
                "input.file.pattern": ".*?adobe_analytics.*?\\.csv",
                "topic": "adobe_analytics"
                }
        }'
        # TODO: schema.generation.enabled: false
        # "key.schema": "",
        # "value.schema": "",

curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d '{
        "name": "marketo_source",
        "config": {
                "tasks.max": "1",
                "connector.class": "com.github.jcustenborder.kafka.connect.spooldir.SpoolDirCsvSourceConnector",
                "input.path": "/home/data",
                "error.path": "/home/data/error",
                "finished.path": "/home/data/finished",
                "halt.on.error": "false",
                "errors.tolerance": "all",
                "errors.deadletterqueue.topic.name": "csv_deadletterqueue",
                "errors.deadletterqueue.topic.replication.factor": "1",
                "empty.poll.wait.ms": "3000",
                "csv.first.row.as.header": "true",
                "schema.generation.enabled": "true",
                "csv.null.field.indicator": "EMPTY_SEPARATORS",
                "csv.separator.char": "59",
                "input.file.pattern": ".*?marketo.*?\\.csv",
                "topic": "marketo"
                }
        }'
        # TODO: schema.generation.enabled: false
        # "key.schema": "",
        # "value.schema": "",
