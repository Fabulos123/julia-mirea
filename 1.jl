include("robot.jl")
include("functions.jl")

function mark_cross!(robot)::Nothing
    putmarker!(robot)
    for side in 0:3
        line_markings!(robot, HorizonSide(side))
    end
end

function line_markings!(robot, direction)
    local k = 0
    while !isborder(robot, direction)
        move!(robot, direction)
        k += 1
        putmarker!(robot)
    end
    along!(robot, inverse(direction), k)
end

print(mark_cross!(r))
