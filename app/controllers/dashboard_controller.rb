class DashboardController < ApplicationController
  #before_filter :authenticate_user!

  def index
    @seriesWeightStr = "[ "
    @seriesSystolicBloodPressureStr = "[ "
    @seriesDiastolicBloodPressureStr = "[ "
    @seriesHeartRateStr = "[ "
    @seriesREMStr = "[ "
    @seriesLightStr = "[ "
    @seriesDeepStr = "[ "
    @seriesSleepScoreStr = "[ "
    @seriesF1FStr = "[ "
    @seriesOpenAndClosedStr = "[ "
    @seriesMotionStr = "[ "
    @seriesTemperatureStr = "[ "

    lookup_id = request.original_url.split('/dashboard.')[1].to_i
    entity_id = Lookup.find(lookup_id).entity_id

    @measures = Measure.where(active: true).where(user_id: entity_id).order(:datetime)

    # Remove measures which are inactive
    @measures.all.each do |measure|
      @subject = measure.title
      @comment = measure.comment
      @id = measure.id
      unless @subject.include? "Invalid"
        @subjectJSON = JSON.parse(@subject.to_s)
        @seriesPartStr = ""
        if @subjectJSON["measures"][0]["name"] == "Weight"
          @datetime = DateTime.parse(@subjectJSON["measures"][0]["time"])
          @value = @subjectJSON["measures"][0]["value"]
          if (@comment.to_s.blank? == false)
            @commentPresent = 8
          else
            @commentPresent = 4
          end
          @seriesWeightStr = @seriesWeightStr + "{name: '" + @comment + "', x: Date.UTC(" + @datetime.year.to_s + ", " + (@datetime.month - 1).to_s + ", " + @datetime.day.to_s + ", " + @datetime.hour.to_s + ", " + @datetime.minute.to_s + ", " + @datetime.second.to_s + "), y: " + @value + ", marker: {radius: " + @commentPresent.to_s + "} , events: { click: function() { window.open('../measures/" + @id.to_s + "/edit','_self'); }} },"
        elsif @subjectJSON["measures"][0]["name"] == "Systolic Blood Pressure"
          @datetime = DateTime.parse(@subjectJSON["measures"][0]["time"])
          @value = @subjectJSON["measures"][0]["value"]
          if (@comment.to_s.blank? == false)
            @commentPresent = 8
          else
            @commentPresent = 4
          end
          @seriesSystolicBloodPressureStr = @seriesSystolicBloodPressureStr + "{name: '" + @comment + "', x: Date.UTC(" + @datetime.year.to_s + ", " + (@datetime.month - 1).to_s + ", " + @datetime.day.to_s + ", " + @datetime.hour.to_s + ", " + @datetime.minute.to_s + ", " + @datetime.second.to_s + "), y: " + @value + ", marker: {radius: " + @commentPresent.to_s + "} , events: { click: function() { window.open('../measures/" + @id.to_s + "/edit','_self'); }} },"
        elsif @subjectJSON["measures"][0]["name"] == 'Diastolic Blood Pressure'
          @datetime = DateTime.parse(@subjectJSON["measures"][0]["time"])
          @value = @subjectJSON["measures"][0]["value"]
          if (@comment.to_s.blank? == false)
            @commentPresent = 8
          else
            @commentPresent = 4
          end
          @seriesDiastolicBloodPressureStr = @seriesDiastolicBloodPressureStr + "{name: '" + @comment + "', x: Date.UTC(" + @datetime.year.to_s + ", " + (@datetime.month - 1).to_s + ", " + @datetime.day.to_s + ", " + @datetime.hour.to_s + ", " + @datetime.minute.to_s + ", " + @datetime.second.to_s + "), y: " + @value + ", marker: {radius: " + @commentPresent.to_s + "} , events: { click: function() { window.open('../measures/" + @id.to_s + "/edit','_self'); }} },"
        elsif @subjectJSON["measures"][0]["name"] == "Heart Rate"
          @datetime = DateTime.parse(@subjectJSON["measures"][0]["time"])
          @value = @subjectJSON["measures"][0]["value"]
          if (@comment.to_s.blank? == false)
            @commentPresent = 8
          else
            @commentPresent = 4
          end
          @seriesHeartRateStr = @seriesHeartRateStr + "{name: '" + @comment + "', x: Date.UTC(" + @datetime.year.to_s + ", " + (@datetime.month - 1).to_s + ", " + @datetime.day.to_s + ", " + @datetime.hour.to_s + ", " + @datetime.minute.to_s + ", " + @datetime.second.to_s + "), y: " + @value + ", marker: {radius: " + @commentPresent.to_s + "} , events: { click: function() { window.open('../measures/" + @id.to_s + "/edit','_self'); }} },"
        elsif (@subjectJSON["measures"][0]["name"] == "REMEpochs")
          @datetime = DateTime.parse(@subjectJSON["measures"][0]["time"])
          @value = ((measure.value).to_i/2*1000*60).to_s
          if (@comment.to_s.blank? == false)
            @commentPresent = true
          else
            @commentPresent = false
          end
          @seriesREMStr = @seriesREMStr + "{name: '" + @comment + "', x: Date.UTC(" + @datetime.year.to_s + ", " + (@datetime.month - 1).to_s + ", " + @datetime.day.to_s + ", " + @datetime.hour.to_s + ", " + @datetime.minute.to_s + ", " + @datetime.second.to_s + "), y: " + @value + ", dataLabels: {enabled: " + @commentPresent.to_s + "} , events: { click: function() { window.open('../measures/" + @id.to_s + "/edit','_self'); }} },"
        elsif (@subjectJSON["measures"][0]["name"] == "LightEpochs")
          @datetime = DateTime.parse(@subjectJSON["measures"][0]["time"])
          @value = ((measure.value).to_i/2*1000*60).to_s
          if (@comment.to_s.blank? == false)
            @commentPresent = true
          else
            @commentPresent = false
          end
          @seriesLightStr = @seriesLightStr + "{name: '" + @comment + "', x: Date.UTC(" + @datetime.year.to_s + ", " + (@datetime.month - 1).to_s + ", " + @datetime.day.to_s + ", " + @datetime.hour.to_s + ", " + @datetime.minute.to_s + ", " + @datetime.second.to_s + "), y: " + @value + ", dataLabels: {enabled: " + @commentPresent.to_s + "} , events: { click: function() { window.open('../measures/" + @id.to_s + "/edit','_self'); }} },"
        elsif (@subjectJSON["measures"][0]["name"] == "DeepEpochs")
          @datetime = DateTime.parse(@subjectJSON["measures"][0]["time"])
          @value = ((measure.value).to_i/2*1000*60).to_s
          if (@comment.to_s.blank? == false)
            @commentPresent = true
          else
            @commentPresent = false
          end
          @seriesDeepStr = @seriesDeepStr + "{name: '" + @comment + "', x: Date.UTC(" + @datetime.year.to_s + ", " + (@datetime.month - 1).to_s + ", " + @datetime.day.to_s + ", " + @datetime.hour.to_s + ", " + @datetime.minute.to_s + ", " + @datetime.second.to_s + "), y: " + @value + ", dataLabels: {enabled: " + @commentPresent.to_s + "} , events: { click: function() { window.open('../measures/" + @id.to_s + "/edit','_self'); }} },"
        elsif (@subjectJSON["measures"][0]["name"] == "SleepScore")
          @datetime = DateTime.parse(@subjectJSON["measures"][0]["time"])
          @value = @subjectJSON["measures"][0]["value"]
          if (@comment.to_s.blank? == false)
            @commentPresent = true
          else
            @commentPresent = false
          end
          @seriesSleepScoreStr = @seriesSleepScoreStr + "{name: '" + @comment + "', x: Date.UTC(" + @datetime.year.to_s + ", " + (@datetime.month - 1).to_s + ", " + @datetime.day.to_s + ", " + @datetime.hour.to_s + ", " + @datetime.minute.to_s + ", " + @datetime.second.to_s + "), y: " + @value + ", dataLabels: {enabled: " + @commentPresent.to_s + "} , events: { click: function() { window.open('../measures/" + @id.to_s + "/edit','_self'); }} },"
        elsif @subjectJSON["measures"][0]["name"] == 'F1F'
          @datetime = DateTime.parse(@subjectJSON["measures"][0]["time"])
          @value = @subjectJSON["measures"][0]["value"].tr(',', '')
          if (@comment.to_s.blank? == false)
            @commentPresent = 8
          else
            @commentPresent = 4
          end
          if (@datetime > Date.today - 7.days)
            @seriesF1FStr = @seriesF1FStr + "{name: '" + @comment + "', x: Date.UTC(" + @datetime.year.to_s + ", " + (@datetime.month - 1).to_s + ", " + @datetime.day.to_s + ", " + @datetime.hour.to_s + ", " + @datetime.minute.to_s + ", " + @datetime.second.to_s + "), y: " + @value + ", marker: {radius: " + @commentPresent.to_s + "} , events: { click: function() { window.open('../measures/" + @id.to_s + "/edit','_self'); }} },"
          end
        elsif @subjectJSON["measures"][0]["name"] == 'Temperature'
          @datetime = DateTime.parse(@subjectJSON["measures"][0]["time"])
          @value = @subjectJSON["measures"][0]["value"].tr(',', '')
          if (@comment.to_s.blank? == false)
            @commentPresent = 8
          else
            @commentPresent = 4
          end
          @seriesTemperatureStr = @seriesTemperatureStr + "{name: '" + @comment + "', x: Date.UTC(" + @datetime.year.to_s + ", " + (@datetime.month - 1).to_s + ", " + @datetime.day.to_s + ", " + @datetime.hour.to_s + ", " + @datetime.minute.to_s + ", " + @datetime.second.to_s + "), y: " + @value + ", marker: {radius: " + @commentPresent.to_s + "} , events: { click: function() { window.open('../measures/" + @id.to_s + "/edit','_self'); }} },"
        elsif @subjectJSON["measures"][0]["name"] == 'OpenAndClosed'
          @datetime = DateTime.parse(@subjectJSON["measures"][0]["time"])
          @value = @subjectJSON["measures"][0]["value"].tr(',', '')
          if @value =="0"
            @oppositeValue = "1"
          else
            @oppositeValue = "0"
          end
          if (@comment.to_s.blank? == false)
            @commentPresent = 8
          else
            @commentPresent = 4
          end
          @seriesOpenAndClosedStr = @seriesOpenAndClosedStr + "{name: '" + @comment + "', x: Date.UTC(" + @datetime.year.to_s + ", " + (@datetime.month - 1).to_s + ", " + @datetime.day.to_s + ", " + @datetime.hour.to_s + ", " + @datetime.minute.to_s + ", " + @datetime.second.to_s + "), y: " + @oppositeValue + ", marker: {radius: " + @commentPresent.to_s + "} , events: { click: function() { window.open('../measures/" + @id.to_s + "/edit','_self'); }} },"
          @seriesOpenAndClosedStr = @seriesOpenAndClosedStr + "{name: '" + @comment + "', x: Date.UTC(" + @datetime.year.to_s + ", " + (@datetime.month - 1).to_s + ", " + @datetime.day.to_s + ", " + @datetime.hour.to_s + ", " + @datetime.minute.to_s + ", " + @datetime.second.to_s + "), y: " + @value + ", marker: {radius: " + @commentPresent.to_s + "} , events: { click: function() { window.open('../measures/" + @id.to_s + "/edit','_self'); }} },"
        elsif @subjectJSON["measures"][0]["name"] == 'Motion'
          @datetime = DateTime.parse(@subjectJSON["measures"][0]["time"])
          @value = @subjectJSON["measures"][0]["value"].tr(',', '')
          if (@comment.to_s.blank? == false)
            @commentPresent = 8
          else
            @commentPresent = 4
          end
          if (@datetime > Date.today - 7.days)
            @seriesMotionStr = @seriesMotionStr + "{name: '" + @comment + "', x: Date.UTC(" + @datetime.year.to_s + ", " + (@datetime.month - 1).to_s + ", " + @datetime.day.to_s + ", " + @datetime.hour.to_s + ", " + @datetime.minute.to_s + ", " + @datetime.second.to_s + "), y: " + @value + ", marker: {radius: " + @commentPresent.to_s + "} , events: { click: function() { window.open('../measures/" + @id.to_s + "/edit','_self'); }} },"
          end
        end
      end
    end

    # Remove last , from string
    @seriesWeightStr = @seriesWeightStr.gsub(/.{1}$/, '')
    @seriesWeightStr = @seriesWeightStr + "]"
    @seriesSystolicBloodPressureStr = @seriesSystolicBloodPressureStr.gsub(/.{1}$/, '')
    @seriesSystolicBloodPressureStr = @seriesSystolicBloodPressureStr + "]"
    @seriesDiastolicBloodPressureStr = @seriesDiastolicBloodPressureStr.gsub(/.{1}$/, '')
    @seriesDiastolicBloodPressureStr = @seriesDiastolicBloodPressureStr + "]"
    @seriesHeartRateStr = @seriesHeartRateStr.gsub(/.{1}$/, '')
    @seriesHeartRateStr = @seriesHeartRateStr + "]"
    @seriesREMStr = @seriesREMStr.gsub(/.{1}$/, '')
    @seriesREMStr = @seriesREMStr + "]"
    @seriesLightStr = @seriesLightStr.gsub(/.{1}$/, '')
    @seriesLightStr = @seriesLightStr + "]"
    @seriesDeepStr = @seriesDeepStr.gsub(/.{1}$/, '')
    @seriesDeepStr = "" + @seriesDeepStr + "]"
    @seriesSleepScoreStr = @seriesSleepScoreStr.gsub(/.{1}$/, '')
    @seriesSleepScoreStr = "" + @seriesSleepScoreStr + "]"
    @seriesF1FStr = @seriesF1FStr.gsub(/.{1}$/, '')
    @seriesF1FStr = @seriesF1FStr + "]"
    @seriesOpenAndClosedStr = @seriesOpenAndClosedStr.gsub(/.{1}$/, '')
    @seriesOpenAndClosedStr = @seriesOpenAndClosedStr + "]"
    @seriesMotionStr = @seriesMotionStr.gsub(/.{1}$/, '')
    @seriesMotionStr = @seriesMotionStr + "]"
    @seriesTemperatureStr = @seriesTemperatureStr.gsub(/.{1}$/, '')
    @seriesTemperatureStr = @seriesTemperatureStr + "]"
  end
end
