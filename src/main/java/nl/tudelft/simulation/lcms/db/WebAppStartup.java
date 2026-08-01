package nl.tudelft.simulation.lcms.db;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

/**
 * WebAppStartup initializes the database connection on startup of the web application.
 * <p>
 * Copyright (c) 2026-2026 Delft University of Technology, PO Box 5, 2600 AA, Delft, the Netherlands. All rights reserved. <br>
 * BSD-3 style license.
 * @author <a href="https://github.com/averbraeck">Alexander Verbraeck</a>
 */
@WebListener
public class WebAppStartup implements ServletContextListener
{
    @Override
    public void contextInitialized(ServletContextEvent sce)
    {
        try
        {
            Database.initialize();
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }
}
