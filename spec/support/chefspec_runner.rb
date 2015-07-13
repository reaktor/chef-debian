# @return [ChefSpec::ChefRunner] a ChefSpec runner for the specified Debian platform
def debian_runner(version, &block)
  ChefSpec::SoloRunner.new(
    platform: 'debian', version: version,
    step_into: %w[debian_repository apt_repository],
    &block)
end
