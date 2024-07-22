#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')

shots = []
scores.each do |s|
  shots << if s == 'X'
             10
           else
             s.to_i
           end
end

frames = []
i = 0

while i < shots.size
  if frames.size < 9
    if shots[i] == 10
      frames << [10]
      i += 1
    else
      frames << [shots[i], shots[i + 1]]
      i += 2
    end
  else
    frames << shots[i..]
    break
  end
end

point = 0

frames.each_with_index do |frame, index|
  if frame[0] == 10 # Strike
    if index < 9
      next_two_shots = frames[index + 1][0..1].sum
      next_two_shots += frames[index + 2][0] if frames[index + 1].size == 1
      point += 10 + next_two_shots
    else
      point += frame.sum
    end
  elsif frame.sum == 10 && frame.size == 2 # Spare
    point += if index < 9
               10 + frames[index + 1][0]
             else
               frame.sum
             end
  else
    point += frame.sum
  end
end

puts point
