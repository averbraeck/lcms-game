package nl.tudelft.simulation.lcms.activity;

/**
 * ActivityState.java.
 * <p>
 * Copyright (c) 2026-2026 Delft University of Technology, PO Box 5, 2600 AA, Delft, the Netherlands. All rights reserved. <br>
 * BSD-3 style license.
 * @author <a href="https://github.com/averbraeck">Alexander Verbraeck</a>
 */
public class ActivityListState
{
    private String sort = "date-change";

    private boolean ascDirection = false;

    private int nrRec = 20;

    private boolean collapse = false;

    private String activityTypes = "running";

    private boolean unread = false;

    private boolean neighbor = false;

    private String searchTerm = "";

    private boolean userOverlay = false;

    public String getSort()
    {
        return this.sort;
    }

    public void setSort(final String sort)
    {
        this.sort = sort;
    }

    public boolean getAscDirection()
    {
        return this.ascDirection;
    }

    public void setAscDirection(final boolean direction)
    {
        this.ascDirection = direction;
    }

    public int getNrRec()
    {
        return this.nrRec;
    }

    public void setNrRec(final int nrRec)
    {
        this.nrRec = nrRec;
    }

    public boolean getCollapse()
    {
        return this.collapse;
    }

    public void setCollapse(final boolean collapse)
    {
        this.collapse = collapse;
    }

    public String getActivityTypes()
    {
        return this.activityTypes;
    }

    public void setActivityTypes(final String activityTypes)
    {
        this.activityTypes = activityTypes;
    }

    public boolean isUnread()
    {
        return this.unread;
    }

    public void setUnread(final boolean unread)
    {
        this.unread = unread;
    }

    public boolean isNeighbor()
    {
        return this.neighbor;
    }

    public void setNeighbor(final boolean neighbor)
    {
        this.neighbor = neighbor;
    }

    public String getSearchTerm()
    {
        return this.searchTerm;
    }

    public void setSearchTerm(final String searchTerm)
    {
        this.searchTerm = searchTerm;
    }

    public boolean isUserOverlay()
    {
        return this.userOverlay;
    }

    public void setUserOverlay(final boolean userOverlay)
    {
        this.userOverlay = userOverlay;
    }

}
