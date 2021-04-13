import unittest
import os

# Global
path = '../../../Day-2/ResourceGroup'


class TestTerraformConfig(unittest.TestCase):

    def test_terraform_init(self):
        os.system(f'cd {path} && terraform init')

    def test_terraform_plan(self):
        name = 'iqmetrixrg'
        location = 'eastus'

        self.assertEqual(name, 'iqmetrixrg')
        self.assertEqual(location, 'eastus')
        os.system(f'cd {path} && terraform plan')

    def test_terraform_apply(self):
        name = 'iqmetrixrg'
        location = 'eastus'

        self.assertEqual(name, 'iqmetrixrg')
        self.assertEqual(location, 'eastus')
        os.system(f'cd {path} && terraform apply -auto-approve')

    def test_terraform_destroy(self):
        name = 'iqmetrixrg'
        location = 'eastus'

        self.assertEqual(name, 'iqmetrixrg')
        self.assertEqual(location, 'eastus')
        os.system(f'cd {path} && terraform destroy -auto-approve')


def suite():
    suite = unittest.TestSuite()
    suite.addTest(TestTerraformConfig('test_terraform_init'))
    suite.addTest(TestTerraformConfig('test_terraform_plan'))
    suite.addTest(TestTerraformConfig('test_terraform_apply'))
    suite.addTest(TestTerraformConfig('test_terraform_destroy'))
    return suite


if __name__ == '__main__':
    runtest = unittest.TextTestRunner(failfast=True)
    runtest.run(suite())
