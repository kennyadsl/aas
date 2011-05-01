class ChallengesController < ApplicationController

  # GET /challenges/new
  # GET /challenges/new.xml
  def new
    @challenge = Challenge.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @challenge }
    end
  end

  # POST /challenges
  # POST /challenges.xml
  def create
    @challenge = Challenge.new(params[:challenge])

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to(root_path, :notice => 'La tua sfida è stata lanciata. Verrai contattao al più presto.') }
        format.xml  { render :xml => @challenge, :status => :created, :location => @challenge }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @challenge.errors, :status => :unprocessable_entity }
      end
    end
  end

end
