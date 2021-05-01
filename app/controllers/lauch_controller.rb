class LauchController < ApplicationController
  before_action :set_global_summary_service
  
  def index
    # usando para imprimir o resultado na tela, depois irei remover
    self.next
    self.latest
    self.past
    self.upcoming
  end

  def past
    @past = @lauch_service.past
  end

  def upcoming
    @upcoming = @lauch_service.upcoming  
  end

  def latest
    @latest = @lauch_service.latest
  end

  def next
    @next = @lauch_service.next
  end

private
  def set_global_summary_service
    @lauch_service = GlobalSumary.new
  end
end
