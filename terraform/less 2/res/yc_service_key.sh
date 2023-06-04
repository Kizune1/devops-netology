#!/bin/bash
rm -rf key.json
yc iam key create --service-account-name * --output key.json
yc iam key create --folder-name * --service-account-name odmin --output key.json
yc iam key create --service-account-id * --output key.json