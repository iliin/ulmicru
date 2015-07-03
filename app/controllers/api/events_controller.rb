class Api::EventsController < Api::ApplicationController
  def index
    events = EventDecorator.decorate Event.confirmed.near_future.drop(params[:offset].to_i).first(params[:count].to_i)
    hash = []
    events.each { |event| event = event.decorate; hash << { id: event.id, photo: event.main_photo.event_main_page_version.url, title: event.title, text: event.lead, date: event.full_date_duration, category: event.activity_line.title } }
    last_events = true if events.count < 8
    render json: { events: hash, last_events: last_events }
  end
end
