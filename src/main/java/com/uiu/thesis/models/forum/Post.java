package com.uiu.thesis.models.forum;

import com.uiu.thesis.models.user.HumanResource;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author ashif
 */
@Entity
@Table(name = "posts")
public class Post implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "content", nullable = false)
    private String contet;

    @Column(name = "post_time", nullable = false)
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date postTime;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private HumanResource poster;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "posts_tags", joinColumns = {
        @JoinColumn(name = "post_id")}, inverseJoinColumns = {
        @JoinColumn(name = "tag_id")})
    private List<TagType> tags;

    /**
     * Constructor
     */
    public Post() {
    }

}
