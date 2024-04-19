require "test_helper"
require "generators/scaffold_plus/scaffold_plus_generator"

class ScaffoldPlusGeneratorTest < Rails::Generators::TestCase
  tests ScaffoldPlusGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
