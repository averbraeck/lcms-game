package nl.tudelft.simulation.lcms.activity;

import java.util.ArrayList;
import java.util.List;

/**
 * ActivityService retrieves a set of activities from the database for the current user and given the filters.
 * <p>
 * Copyright (c) 2026-2026 Delft University of Technology, PO Box 5, 2600 AA, Delft, the Netherlands. All rights reserved. <br>
 * BSD-3 style license.
 * @author <a href="https://github.com/averbraeck">Alexander Verbraeck</a>
 */
public class ActivityService
{
    public static List<ActivityLine> getActivities(String sort, String direction)
    {
        List<ActivityLine> list = new ArrayList<>();
        ActivityLine line1 = new ActivityLine(2, false, "Wateroverlast Lekkerkerk", "GRIP 1", "VR016 Hollands Midden",
                "11:28 - 07-08-2027", "11:28 - 07-08-2027", true);
        list.add(line1);
        ActivityLine line2 = new ActivityLine(1, false, "Wateroverlast Gouderak", "GRIP 1", "VR016 Hollands Midden",
                "11:04 - 07-08-2027", "11:05 - 07-08-2027", true);
        list.add(line2);
        return list;
    }
}
