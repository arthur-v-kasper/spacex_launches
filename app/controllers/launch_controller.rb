class LaunchController < ApplicationController
  before_action :set_global_summary_service
  
  def index
    self.next
    self.latest
    self.past
    self.upcoming
  end

  def past
    @past = @launch_service.past
  end

  def upcoming
    @upcoming = @launch_service.upcoming  
  end

  def latest
    @latest = @launch_service.latest
  end

  def next
    @next = @launch_service.next
  end

private
  def set_global_summary_service
    @launch_service = GlobalSumary.new
  end
end
