package nl.tudelft.simulation.lcms.util;

import jakarta.servlet.http.HttpServletRequest;

/**
 * Request.java.
 * <p>
 * Copyright (c) 2026-2026 Delft University of Technology, PO Box 5, 2600 AA, Delft, the Netherlands. All rights reserved. <br>
 * BSD-3 style license.
 * @author <a href="https://github.com/averbraeck">Alexander Verbraeck</a>
 */
public class Request
{
    public static String getParameter(HttpServletRequest req, String name, String defaultValue)
    {
        String value = req.getParameter(name);
        if (value == null)
            return defaultValue;
        return value;
    }
    
    public static int getParameter(HttpServletRequest req, String name, int defaultValue)
    {
        String valueStr = req.getParameter(name);
        if (valueStr == null)
            return defaultValue;
        int value;
        try
        {
            value = Integer.parseInt(valueStr);
        }
        catch (Exception e)
        {
            return defaultValue;
        }
        return value;
    }
}
