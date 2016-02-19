#!/bin/bash
nova rebuild ockubeumaster os-build-<os>-image
nova rebuild ockubeunode01 os-build-<os>-image
nova rebuild ockubeunode02 os-build-<os>-image
nova rebuild ockubeunode03 os-build-<os>-image
nova rebuild ockubeuvrouter os-build-<os>-image
