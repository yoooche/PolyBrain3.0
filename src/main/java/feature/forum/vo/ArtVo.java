package web.forum.vo;

import core.coreVO.Core;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serial;
import java.time.LocalDateTime;
import java.util.Date;

@Entity(name = "ARTICLE")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ArtVo extends Core {
    @Serial
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "ARTICLE_NO",insertable = false)
    private Integer artNo;
    @Column(name = "MEM_NO")
    private Integer memNo;
    @Column(name = "ARTICLE_TITLE")
    private String artTitle;
    @Column(name = "ARTICLE_CONTENT")
    private String artCon;
    @Column(name = "ARTICLE_TIME",insertable = false)
    private Date artTime;
    @Column(name = "ARTICLE_STATE")
    private Byte artState;
    @Column(name = "ARTICLE_GAME")
    private Integer artGame;

}
