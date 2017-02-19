require "./spec_helper"
require "../src/crometheus/standard_exports"

# This is really just a test that ProcFSExports reads procfs properly.
# The samples from StandardExports come from Crystal itself and can't
# really be verified from the outside.

# This will fail on non-procfs environments, e.g. MacOS.
# In actual usage, make_standard_exports *should* fall back to
# generating StandardExports instead of ProcFSExports, but this is not
# tested.
# TODO fix this.

describe Crometheus do
  describe ".make_standard_exports" do
    it "returns a ProcFSExports object" do
      Crometheus.make_standard_exports(:x, "", nil).should(
        be_a Crometheus::StandardExports::ProcFSExports)
    end
  end
end

describe Crometheus::StandardExports::ProcFSExports do
  it "should return appropriate samples from procfs" do
    exports = Crometheus::StandardExports::ProcFSExports.new(:x, "",
      nil, 26231, "./spec/proc")
    samples = get_samples(exports)

    samples.should contain Crometheus::Sample.new(56274944.0, suffix: "_virtual_memory_bytes")
    samples.should contain Crometheus::Sample.new(8114176.0, suffix: "_resident_memory_bytes")
    samples.should contain Crometheus::Sample.new(1418184099.75, suffix: "_start_time_seconds")
    samples.should contain Crometheus::Sample.new(2048.0, suffix: "_max_fds")
    samples.should contain Crometheus::Sample.new(5.0, suffix: "_open_fds")
  end
end