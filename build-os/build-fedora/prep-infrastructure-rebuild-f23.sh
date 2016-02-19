#!/bin/bash
nova rebuild <servername>master os-build-<os>-image
nova rebuild <servername>node01 os-build-<os>-image
nova rebuild <servername>node02 os-build-<os>-image
nova rebuild <servername>node03 os-build-<os>-image
nova rebuild <servername>vrouter os-build-<os>-image
