require "test_helper"
require "generators/kwik_scaffold/kwik_scaffold_generator"

class KwikScaffoldGeneratorTest < Rails::Generators::TestCase
  tests KwikScaffoldGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
