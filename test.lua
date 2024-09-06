-- A simple coroutine example
i = 0
k = 0
function task1()
    while true do
	i = i + 1
        print("Task 1 - step " .. i)
        coroutine.yield()  -- Pauses the execution
    end
end

function task2()
    while true do
	k = i + 1
        print("Task 2 - step " .. k)
        coroutine.yield()  -- Pauses the execution
    end
end

-- Create coroutines
co1 = coroutine.create(task1)
co2 = coroutine.create(task2)

-- Resume them in an alternating fashion
while coroutine.status(co1) ~= "dead" or coroutine.status(co2) ~= "dead" do
    if coroutine.status(co1) ~= "dead" then coroutine.resume(co1) end
    if coroutine.status(co2) ~= "dead" then coroutine.resume(co2) end
end

