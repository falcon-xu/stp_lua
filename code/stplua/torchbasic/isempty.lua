function isempty(a)
    -- overloaded isempty method for lm class
    local x = a.v
    if (x:nDimension() == 0) then
        -- body
        return 1
    else
        return 0
    end
end
