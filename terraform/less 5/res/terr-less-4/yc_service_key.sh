#!/bin/bash
rm -rf key.json
yc iam key create --service-account-name odmin --output key.json
yc iam key create --folder-name netology --service-account-name odmin --output key.json
yc iam key create --service-account-id ajefqcden7i56oe9haph --output key.json
