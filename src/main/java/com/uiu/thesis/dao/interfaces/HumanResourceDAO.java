package com.uiu.thesis.dao.interfaces;

import com.uiu.thesis.models.user.AccessType;
import com.uiu.thesis.models.user.HumanResource;
import com.uiu.thesis.models.user.HumanResourceType;
import com.uiu.thesis.models.user.Role;
import java.util.List;
import java.util.Set;

/**
 *
 * @author ashif
 */
public interface HumanResourceDAO {

    public int addHumanResource(HumanResource hr);

    public int updateHumanResource(HumanResource hr);

    public int updateHumanResource(HumanResource hr, Role role);

    public int updateHumanResource(HumanResource hr, Set<AccessType> accessTypes);

    public int updateHumanResource(HumanResource hr, HumanResourceType hrType);

    public int deleteHumanResource(HumanResource hr);

    public HumanResource getHumanResource(Long id);

    public HumanResource getHumanResource(String email);

    public List<HumanResource> getAllHumanResources();

    public List<HumanResource> getHumanResourcesByHRType(Long hrTypeId);

    public List<HumanResource> getHumanResourcesByRole(Long roleId);

    public List<HumanResource> getHumanResourcesByAccessType(Long accessTypeId);
}
