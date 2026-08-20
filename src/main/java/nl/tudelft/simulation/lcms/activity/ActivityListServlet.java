package nl.tudelft.simulation.lcms.activity;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import nl.tudelft.simulation.lcms.util.Request;

/**
 * ActivityServlet prepares the data for the activity table overview.
 * <p>
 * Copyright (c) 2026-2026 Delft University of Technology, PO Box 5, 2600 AA, Delft, the Netherlands. All rights reserved. <br>
 * BSD-3 style license.
 * @author <a href="https://github.com/averbraeck">Alexander Verbraeck</a>
 */
@WebServlet("/activity-list")
public class ActivityListServlet extends HttpServlet
{
    /** */
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException
    {
        ActivityListState state = (ActivityListState) req.getSession().getAttribute("activityListState");
        if (state == null)
        {
            state = new ActivityListState();
            req.getSession().setAttribute("activityListState", state);
        }
        String command = Request.getParameter(req, "command", "refresh");
        String sub = "";
        if (command.contains(":"))
        {
            sub = command.substring(command.indexOf(':') + 1);
            command = command.substring(0, command.indexOf(':'));
        }
        String searchTerm = Request.getParameter(req, "search-term", "");
        System.out.println(command);
        System.out.println(" -- search term = " + searchTerm);
        switch (command)
        {
            case "running" -> state.setActivityTypes("running");
            case "prepared" -> state.setActivityTypes("prepared");
            case "all" -> state.setActivityTypes("all");
            case "collapse" -> state.setCollapse(!state.getCollapse());
            case "unread" -> state.setUnread(!state.isUnread());
            case "neighbor" -> state.setNeighbor(!state.isNeighbor());
            case "more" -> state.setNrRec(state.getNrRec() + 20);
            case "sort" ->
            {
                if (sub.equals(state.getSort()))
                    state.setAscDirection(!state.getAscDirection());
                else
                {
                    state.setSort(sub);
                    state.setAscDirection(sub.contains("date") ? false : true);
                }
            }
            case "search" ->
            {
                state.setSearchTerm(searchTerm);
            }
            case "clear-search" ->
            {
                searchTerm = "";
                state.setSearchTerm(searchTerm);
            }
            case "menu" ->
            {
                switch (sub)
                {
                    case "logout" ->
                    {
                        req.getRequestDispatcher("logout").forward(req, resp);
                        return;
                    }
                }
            }

        }

        List<ActivityLine> messages = ActivityListService.getActivities(state);
        req.setAttribute("messages", messages);
        req.setAttribute("searchTerm", searchTerm);

        req.getRequestDispatcher("jsp/activity-list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException
    {
        doGet(req, resp);
    }

}
