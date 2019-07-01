function fizzbuzz(n)
    for i in 1:n
        if i % 15 == 0
            println("fizzbuzz")
        elseif i % 3 == 0
            println("fizz")
        elseif i % 5 == 0
            println("buzz")
        else
            println(i)
        end
    end
end


fizzbuzz(30)
