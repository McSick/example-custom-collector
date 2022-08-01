#!bin/bash
docker build -t collector-with-dd-receiver:0.56.0 .
docker tag collector-with-dd-receiver:0.56.0 msickleshoneycomb/collector-with-dd-receiver:0.56.0
docker push msickleshoneycomb/collector-with-dd-receiver:0.56.0