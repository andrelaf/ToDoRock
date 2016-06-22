module HomeHelper
    def color_task_priority(priority)
        case priority
            when "Low"
            "success"
            when "Normal"
            "info"
            when "High"
            "warning"
            when "Blocking"
            "danger"
            else
            "info"
        end
    end
end
