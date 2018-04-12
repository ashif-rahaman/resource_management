package com.uiu.thesis.controllers.rest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.uiu.thesis.models.complaint.ComplaintType;
import com.uiu.thesis.services.interfaces.ComplaintTypeService;
import java.text.SimpleDateFormat;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ashif
 */
@RestController(value = "/api/service/office/complainttype")
public class ComplaintTypeRestController {

    @Autowired
    private ComplaintTypeService complaintTypeService;

    private SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss a");

    /**
     * Returns all the the complaint types
     *
     * @return
     */
    @RequestMapping(
            value = "/api/service/office/complainttype",
            produces = {"application/json;charset:UTF-8"},
            method = RequestMethod.GET)
    public String getComplaintTypes() {

        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setDateFormat(df);

        List<ComplaintType> complaintTypes = complaintTypeService.getAllComplaintTypes();

        if (complaintTypes != null && complaintTypes.size() > 0) {

            try {

                return objectMapper.writeValueAsString(complaintTypes);
            } catch (JsonProcessingException e) {

                System.err.println(e.toString());
            }
        }
        return "[]";
    }
}