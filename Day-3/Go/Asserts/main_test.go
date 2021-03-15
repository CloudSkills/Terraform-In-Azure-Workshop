package main

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformResourceGroup(t *testing.T) {
	location := "eastus"
	rgName := "iqmetrixrg"

	options := &terraform.Options{
		TerraformDir: "../../../Day-2/ResourceGroup/",
	}

	defer terraform.Destroy(t, options)

	init := terraform.Init(t, options)

	t.Log(init)

	plan := terraform.Plan(t, options)

	t.Log(plan)

	apply := terraform.Apply(t, options)

	t.Log(apply)

	assert.Equal(t, location, "eastus", "Location should be eastus")
	assert.Contains(t, rgName, "iqmetrix")
}
