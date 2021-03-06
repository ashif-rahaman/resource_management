package com.uiu.thesis.dao.implement;

import com.uiu.thesis.dao.interfaces.OfficeResourceTypeDAO;
import com.uiu.thesis.models.object_resource.OfficeResourceType;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ashif
 */
@Repository
@Transactional
public class OfficeResourceTypeDAOImpl implements OfficeResourceTypeDAO {

    @Autowired(required = true)
    private SessionFactory sessionFactory;

    /**
     * Insert an office resource type object into database
     *
     * @param officeResourceType
     * @return
     */
    @Override
    public int addOfficeResourceType(OfficeResourceType officeResourceType) {

        Session session = sessionFactory.getCurrentSession();
        Long ret = (Long) session.save(officeResourceType);

        return Integer.valueOf(ret.toString());
    }

    @Override
    public boolean updateOfficeResourceType(OfficeResourceType oldType, OfficeResourceType newType) {

        return false;
    }

    @Override
    public boolean updateOfficeResourceType(Long oldTypeId, OfficeResourceType newType) {

        return false;
    }

    @Override
    public boolean deleteOfficeResourceType(OfficeResourceType officeResourceType) {

        return false;
    }

    @Override
    public boolean deleteOfficeResourceType(Long typeId) {

        return false;
    }

    /**
     * Read an object of OfficeResourceType from database by the id(primary key)
     *
     * @param typeId
     * @return
     */
    @Override
    public OfficeResourceType getOfficeResourceType(Long typeId) {

        if (typeId > 0) {

            Session session = sessionFactory.getCurrentSession();
            return (OfficeResourceType) session.get(OfficeResourceType.class, typeId);
        }

        return null;
    }

    /**
     * Read all the Office Resource types from "office_resource_types" table
     *
     * @return
     */
    @Override
    public List<OfficeResourceType> getAllOfficeResourceTypes() {

        Session session = sessionFactory.getCurrentSession();
        String hql = "FROM OfficeResourceType";

        @SuppressWarnings("unchecked")
        List<OfficeResourceType> orType = session.createQuery(hql).list();

        return orType;
    }

    /**
     *
     * @param type
     * @return
     */
    @Override
    public OfficeResourceType getOfficeResourceType(String type) {

        List<OfficeResourceType> resourceTypes = getAllOfficeResourceTypes();

        for (OfficeResourceType resourceType : resourceTypes) {

            if (resourceType.getResourceType().equals(type.trim())) {

                return resourceType;
            }
        }

        return null;
    }
}
