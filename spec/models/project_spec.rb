require 'spec_helper'

describe Project do
  describe "default order" do
    before do
      @project_one = FactoryGirl.create(:project, name: "A Project")
      @project_three = FactoryGirl.create(:project, name: "Z Project")
      @project_two = FactoryGirl.create(:project, name: "B Project")
      @project_four = FactoryGirl.create(:project, name: "Out", virtual: true)
    end

    it "Returns projects in alphabetical order with virtual projects at the end" do
      Project.all.first.should == @project_one
      Project.all.second.should == @project_two
      Project.all.third.should == @project_three
      Project.all.last.should == @project_four
    end
  end
end
