package com.uiu.thesis.dao.implement;

import com.uiu.thesis.dao.interfaces.ComplaintTypeDAO;
import com.uiu.thesis.models.complaint.ComplaintType;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Criteria;
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
public class ComplaintTypeDAOImpl implements ComplaintTypeDAO {

    @Autowired(required = true)
    private SessionFactory sessionFactory;

    @Override
    public int addComplaintType(ComplaintType complaintType) {

        Session session = sessionFactory.getCurrentSession();
        Long ret = (Long) session.save(complaintType);
        return Integer.valueOf(ret.toString());
    }

    @Override
    public int updateComplaintType(ComplaintType complaintType) {

        return 0;
    }

    /**
     * Read all the complaint types from "complaint_types" table
     *
     * @return
     */
    @Override
    public List<ComplaintType> getComplaintTypes() {

        Session session = sessionFactory.getCurrentSession();
        Criteria criteria = session.createCriteria(ComplaintType.class);

        @SuppressWarnings("unchecked")
        List<ComplaintType> complaintTypes = criteria.list();

        return complaintTypes;
    }

    @Override
    public int deleteComplaintType(ComplaintType complaintType) {

        return 0;
    }

    @Override
    public int deleteComplaintType(Long id) {

        return 0;
    }

}
