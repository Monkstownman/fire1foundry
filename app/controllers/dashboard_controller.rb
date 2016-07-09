class DashboardController < ApplicationController
  #before_filter :authenticate_user!

  def index
    @seriesWeightStr = "[ "
    @seriesSystolicBloodPressureStr = "[ "
    @seriesDiastolicBloodPressureStr = "[ "
    @seriesHeartRateStr = "[ "
    @measures = Measure.where(active: true).order(:datetime)

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
        elsif @subjectJSON["measures"][0]["name"] == 'Bank Balance Joint Account'
          @datetime = DateTime.parse(@subjectJSON["measures"][0]["time"])
          @value = @subjectJSON["measures"][0]["value"].tr(',', '')
          if (@comment.to_s.blank? == false)
            @commentPresent = 8
          else
            @commentPresent = 4
          end
          @seriesJointStr = @seriesJointStr + "{name: '" + @comment + "', x: Date.UTC(" + @datetime.year.to_s + ", " + (@datetime.month - 1).to_s + ", " + @datetime.day.to_s + ", " + @datetime.hour.to_s + ", " + @datetime.minute.to_s + ", " + @datetime.second.to_s + "), y: " + @value + ", marker: {radius: " + @commentPresent.to_s + "} , events: { click: function() { window.open('../measures/" + @id.to_s + "/edit','_self'); }} },"

        end
      end
    end

    # Remove last , from string
    @seriesWeightStr = @seriesWeightStr.gsub(/.{1}$/, '')

    @seriesWeightStr = @seriesWeightStr + "]"
    @seriesSystolicBloodPressureStr = @seriesSystolicBloodPressureStr.gsub(/.{1}$/, '')
    @seriesSystolicBloodPressureStr = @seriesWeightStr
    @seriesDiastolicBloodPressureStr = @seriesDiastolicBloodPressureStr.gsub(/.{1}$/, '')
    @seriesDiastolicBloodPressureStr = @seriesWeightStr
    @seriesHeartRateStr = @seriesHeartRateStr.gsub(/.{1}$/, '')
    @seriesHeartRateStr =@seriesWeightStr

  end
end
