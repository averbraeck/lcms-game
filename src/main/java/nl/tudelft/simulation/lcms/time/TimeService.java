package nl.tudelft.simulation.lcms.time;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * TimeService provides the game time to a servlet.
 * <p>
 * Copyright (c) 2026-2026 Delft University of Technology, PO Box 5, 2600 AA, Delft, the Netherlands. All rights reserved. <br>
 * BSD-3 style license.
 * @author <a href="https://github.com/averbraeck">Alexander Verbraeck</a>
 */
@WebServlet("/api/gametime")
public class TimeService extends HttpServlet
{
    /** */
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("application/json");
        String currentTime = new SimpleDateFormat("HH:mm dd-MM-yyyy").format(new Date());
        resp.getWriter().write("{\"time\": \"" + currentTime + "\"}");
    }
}
