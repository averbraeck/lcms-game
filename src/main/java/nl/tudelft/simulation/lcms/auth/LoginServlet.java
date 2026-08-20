package nl.tudelft.simulation.lcms.auth;

import java.io.IOException;

import org.jooq.DSLContext;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import nl.tudelft.simulation.lcms.data.Tables;
import nl.tudelft.simulation.lcms.data.tables.records.GebruikerRecord;
import nl.tudelft.simulation.lcms.db.Database;
import nl.tudelft.simulation.lcms.util.PasswordUtil;

/**
 * User login.
 * <p>
 * Copyright (c) 2026-2026 Delft University of Technology, PO Box 5, 2600 AA, Delft, the Netherlands. All rights reserved. <br>
 * BSD-3 style license.
 * @author <a href="https://github.com/averbraeck">Alexander Verbraeck</a>
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws IOException
    {
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response)
            throws ServletException, IOException
    {
        try
        {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            System.out.println("Login servlet, username = " + username);
            DSLContext dsl = Database.dsl();

            GebruikerRecord user = dsl.selectFrom(Tables.GEBRUIKER).where(Tables.GEBRUIKER.INLOG_NAAM.eq(username)).fetchOne();

            if (user != null && PasswordUtil.verify(password, user.getPasswordHash()))
            {
                HttpSession session = request.getSession(true);
                session.setAttribute("user", user);
                response.sendRedirect("/lcms/activity-list");
                return;
            }

            response.sendRedirect("login.jsp?error=true");
        }
        catch (Exception e)
        {
            throw new ServletException("Login failed with exception", e);
        }
    }
}
