AllTriggers = {}

OnInit(function ()
    for i = 1, #AllTriggers do
        AllTriggers[i]()
    end
    AllTriggers = nil
end)