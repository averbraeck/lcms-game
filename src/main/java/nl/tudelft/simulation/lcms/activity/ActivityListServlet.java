package nl.tudelft.simulation.lcms.activity;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * ActivityServlet prepares the data for the activity table overview.
 * <p>
 * Copyright (c) 2026-2026 Delft University of Technology, PO Box 5, 2600 AA, Delft, the Netherlands. All rights reserved. <br>
 * BSD-3 style license.
 * @author <a href="https://github.com/averbraeck">Alexander Verbraeck</a>
 */
@WebServlet("/overzicht")
public class ActivityListServlet extends HttpServlet
{
    /** */
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String sort = req.getParameter("sort");
        String direction = req.getParameter("direction");

        if (sort == null)
        {
            sort = "wijzigDatum";
        }

        if (direction == null)
        {
            direction = "desc";
        }

        List<ActivityLine> messages = ActivityService.getActivities(sort, direction);

        req.setAttribute("messages", messages);
        req.setAttribute("sort", sort);
        req.setAttribute("direction", direction);

        req.getRequestDispatcher("jsp/overzicht.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doGet(req, resp);
    }

}
