using Test

macro isCalledFromFunction()
    expr = esc(:(
        try
            currentFunctionName = nameof(var"#self#")
            true
        catch
            false
        end
    ))
    return expr
end



macro mactest()
    expr = esc(:(
    	try
            currentFunctionName = nameof(var"#self#")
        catch
            "no function name"
        end
    ))

    return expr
end

test = @mactest

Main.trace = stacktrace()


function functest()
    @show var"#self#"

    println("testset trace:")
    @testset begin 
        display(stacktrace())
        Main.trace = stacktrace()
    end

    println("normal trace:")
    stacktrace()
end

st = functest()



macro testexprs(expressions...)
    @show expressions
    @show __module__
    @show __source__ 

    return expressions

    return esc(
        quote
            # Executes the code twice to exclude the allocation cost of the first call
            $(expressions...)
        end
    )
end

exprs = @testexprs no_allocate println((x -> "hi")(1))

include("allocation_macros.jl")

@macroexpand @testnoallocations onlyonce 2