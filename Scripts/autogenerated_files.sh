#!/bin/sh

SWIFTGEN_MODULES=(
	"SharedResources"
	)

MODULES_FOLDER="./MediumRarePotato/Packages"

for MODULE in "${SWIFTGEN_MODULES[@]}"; do
	MODULE_DIR="${MODULES_FOLDER}/${MODULE}"
	mkdir -p "${MODULE_DIR}/Sources/${MODULE}/Generated"
	swiftgen config run --config "${MODULE_DIR}/swiftgen.yml"
done

SOURCERY_MODULES=(
	)

for MODULE in "${SOURCERY_MODULES[@]}"; do
	MODULE_DIR="${MODULES_FOLDER}/${MODULE}"
	sourcery --config "${MODULE_DIR}/.sourcery.yml"
done
