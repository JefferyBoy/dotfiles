-- cut_video.lua
local start_time = nil
local end_time = nil

mp.add_key_binding("(", "mark_start", function()
    start_time = mp.get_property_number("time-pos")
    mp.msg.info("Start time marked: " .. start_time)
end)

mp.add_key_binding(")", "mark_end", function()
    end_time = mp.get_property_number("time-pos")
    mp.msg.info("End time marked: " .. end_time)
end)

mp.add_key_binding("Ctrl+S", "save_clip", function()
    if start_time and end_time then
        local input_file = mp.get_property("path")
        local output_file = "clip_" .. start_time .. "_" .. end_time .. ".mp4"
        local command = string.format("ffmpeg -i %s -ss %f -to %f -c copy %s", input_file, start_time, end_time, output_file)
        mp.msg.info("Saving clip with command: " .. command)
        os.execute(command)
    else
        mp.msg.info("Start or end time not marked.")
    end
end)
