class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    Event.past.each do |event|
      event.color = '#9e9e9e'
      event.save!
    end
    Event.current.each do |event|
      case event.title
      when "Weekly Reset"
        event.color = '#3a87ad'
        event.save!
      when "Vanguard Daily"
        event.color = '#f36621'
        event.save!
      when "Gambit Daily"
        event.color = '#0b7b4d'
        event.save!
      when "Crucible Daily"
        event.color = '#c62b29'
        event.save!
      when "Daily Heroic Adventure"
        event.color = '#232b57'
        event.save!
      end
    end
    Event.upcoming.each do |event|
      case event.title
      when "Weekly Reset"
        event.color = '#7194a5'
        event.save!
      when "Vanguard Daily"
        event.color = '#ec976e'
        event.save!
      when "Gambit Daily"
        event.color = '#466d5d'
        event.save!
      when "Crucible Daily"
        event.color = '#c15d5b'
        event.save!
      when "Daily Heroic Adventure"
        event.color = '#383b4f'
        event.save!
      end
    end
    @events = Event.all
    @ending_next = Event.ends_next.all
    @next_reset = Event.next_event.end

    respond_to do |format|
      format.html
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start, :end)
    end
end
