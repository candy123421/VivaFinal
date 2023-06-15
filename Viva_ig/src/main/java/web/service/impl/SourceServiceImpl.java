package web.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.SourceDao;
import web.dto.Pack;
import web.dto.PackLike;
import web.dto.SourceFileInfo;
import web.dto.SourceLike;
import web.dto.Tag;
import web.service.face.SourceService;
import web.util.Paging;

@Service
public class SourceServiceImpl implements SourceService{

	@Autowired SourceDao sourceDao;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public List<Tag> getTag(Tag genre) {
		
		List<Tag> tag = sourceDao.selectTagByGenre(genre);
		
		if( genre.getInstrument() != null ) {
			for(int i=0; i<tag.size(); i++) {
				
				String remove = genre.getInstrument();
				
				try {
					if ( tag.get(i).getInstrument() != null && tag.get(i).getInstrument().equals(remove) ) {
						tag.remove(i);
					}
				} catch (NullPointerException e) {
					e.printStackTrace();
				}
			}
		} else if(genre.getGenre() != null) {
			
				for(int i=0; i<tag.size(); i++) {
				
				String remove = genre.getGenre();
				
				try {
					if ( tag.get(i).getGenre() != null && tag.get(i).getGenre().equals(remove) ) {
						tag.remove(i);
					}
				} catch (NullPointerException e) {
					e.printStackTrace();
				}
			}
			
		}
		
		return tag;
	}

	@Override
	public List<Tag> getTagScape(Tag genre) {
		
		List<Tag> tag = sourceDao.selectTagByGenreforScape(genre);
		
		if( genre.getScape() != null ) {
			for(int i=0; i<tag.size(); i++) {
				
				String remove = genre.getScape();
				
				try {
					if ( tag.get(i).getScape() != null && tag.get(i).getScape().equals(remove) ) {
						tag.remove(i);
					}
				} catch (NullPointerException e) {
					e.printStackTrace();
				}
			}
		}
		return tag;
	}

	@Override
	public List<Tag> getTagDetail(Tag genre) {
		
		List<Tag> tag = sourceDao.selectTagByGenreforDetail(genre);
		
		if( genre.getDetail() != null ) {
			for(int i=0; i<tag.size(); i++) {
				
				String remove = genre.getDetail();
				
				try {
					if ( tag.get(i).getDetail() != null && tag.get(i).getDetail().equals(remove) ) {
						tag.remove(i);
					}
				} catch (NullPointerException e) {
					e.printStackTrace();
				}
			}
		}
		
		return tag;
	}

	@Override
	public List<Tag> getTagFx(Tag genre) {
		
		List<Tag> tag = sourceDao.selectTagByGenreforFx(genre);
		
		if( genre.getFx() != null ) {
			for(int i=0; i<tag.size(); i++) {
				
				String remove = genre.getFx();
				
				try {
					if ( tag.get(i).getFx() != null && tag.get(i).getFx().equals(remove) ) {
						tag.remove(i);
					}
				} catch (NullPointerException e) {
					e.printStackTrace();
				}
			}
		}
		
		return tag;
	}

	@Override
	public List<Map<String, Object>> getSourceByGenre(Tag genre, HttpSession session) {
		
		Map<String, Object> list = new HashMap();
		
		if( genre.getDetail() != null) {
			
			logger.info("detail 로 들어옴");
			list.put("genre", genre.getGenre());
			list.put("userNo", session.getAttribute("userNo"));
			list.put("detail", genre.getDetail());
			
		} else if( genre.getInstrument() != null) {
			
			logger.info("inst 로 들어옴");
			list.put("genre", genre.getGenre());
			list.put("userNo", session.getAttribute("userNo"));
			list.put("instrument", genre.getInstrument());
			
		} else if( genre.getFx() != null) {
			
			logger.info("Fx 로 들어옴");
			list.put("genre", genre.getGenre());
			list.put("userNo", session.getAttribute("userNo"));
			list.put("fx", genre.getFx());
			
		} else if( genre.getScape() != null ) {
			
			logger.info("Fx 로 들어옴");
			list.put("genre", genre.getGenre());
			list.put("userNo", session.getAttribute("userNo"));
			list.put("scape", genre.getScape());
			
		}
		
		list.put("genre", genre.getGenre());
		list.put("userNo", session.getAttribute("userNo"));
		
		return sourceDao.selectSourceByGenre(list);
	}

	@Override
	public void sourceLike(SourceLike like) {
		sourceDao.insertSourceLike(like);
	}

	@Override
	public boolean chkLike(SourceLike like) {
		
		int chk = sourceDao.selectByLike(like);
		
		if( chk > 0 ) {
			return true;
		}
		return false;
	}

	@Override
	public void sourceDestLike(SourceLike like) {
		sourceDao.deleteByLike(like);
	}

	@Override
	public SourceFileInfo getFile(SourceFileInfo down) {
		
		return sourceDao.selectBySourceNoforFile(down);
	}

	@Override
	public List<Tag> getTagGenre(Tag instrument) {
		
		List<Tag> tag = sourceDao.selectTagByInstDetail(instrument);
		
		return tag;
	}

	@Override
	public Tag getInst(Tag instrument) {
		
		if(instrument.getInstrument() != null && "".equals(instrument.getInstrument())) {
			return instrument;
		}
		
		String[] Drum = {"Kick","Snare","808","Hihat","Clap","Tom","Cymbal","Fills","Percussion","Rimshot"};
		String[] Vocal = {"Female","Male","Phrases","Whispers","Screams","Dialogue"};
		String[] Synth = {"Bass","Lead","Pad","Arp","Pluck","Chord"};
		String[] Brass = {"Saxophone","Trumpet","Trombone","Ensemble"};
		String[] Wood = {"Flute","Harmonica","Clarinet"};
		String[] Guitar = {"Acoustic","Clean","Dist","Rhythm","Solo","Riff"};
		String[] Bass = {"Synth","Analog","Electric"};
		String[] String = {"Violin","Cello","Viola","Contrabass","Orchestral","StringPad","Staccato","Pizzicato"};
		
		
		Tag res = new Tag();
		
		for(int i=0; i<Drum.length; i++) {
			if(instrument.getDetail() != null && instrument.getDetail().equals(Drum[i])) {
				res.setInstrument("Drum");
				res.setDetail(instrument.getDetail());
				logger.info("악기 확인 : {}",res);
				return res;
			}
		}
		
		Tag res1 = new Tag();
		
		for(int i=0; i<Vocal.length; i++) {
			if(instrument.getDetail() != null && instrument.getDetail().equals(Vocal[i])) {
				res1.setInstrument("Vocal");
				res1.setDetail(instrument.getDetail());
				logger.info("악기 확인 : {}",res1);
				return res1;
			}
		}
		
		Tag res2 = new Tag();
		
		for(int i=0; i<Synth.length; i++) {
			if(instrument.getDetail() != null && instrument.getDetail().equals(Synth[i])) {
				res2.setInstrument("Synth");
				res2.setDetail(instrument.getDetail());
				logger.info("악기 확인 : {}",res2);
				return res2;
			}
		}
		
		Tag res3 = new Tag();
		
		for(int i=0; i<Brass.length; i++) {
			if(instrument.getDetail() != null && instrument.getDetail().equals(Brass[i])) {
				res3.setInstrument("Brass");
				res3.setDetail(instrument.getDetail());
				logger.info("악기 확인 : {}",res3);
				return res3;
			}
		}
		
		Tag res4 = new Tag();
		
		for(int i=0; i<Wood.length; i++) {
			if(instrument.getDetail() != null && instrument.getDetail().equals(Wood[i])) {
				res4.setInstrument("WoodWinds");
				res4.setDetail(instrument.getDetail());
				logger.info("악기 확인 : {}",res4);
				return res4;
			}
		}
		
		Tag res5 = new Tag();
		
		for(int i=0; i<Guitar.length; i++) {
			if(instrument.getDetail() != null && instrument.getDetail().equals(Guitar[i])) {
				res5.setInstrument("Guitar");
				res5.setDetail(instrument.getDetail());
				logger.info("악기 확인 : {}",res5);
				return res5;
			}
		}
		
		Tag res6 = new Tag();
		
		for(int i=0; i<Bass.length; i++) {
			if(instrument.getDetail() != null && instrument.getDetail().equals(Bass[i])) {
				res6.setInstrument("Bass");
				res6.setDetail(instrument.getDetail());
				logger.info("악기 확인 : {}",res6);
				return res6;
			}
		}
		
		Tag res7 = new Tag();
		
		for(int i=0; i<String.length; i++) {
			if(instrument.getDetail() != null && instrument.getDetail().equals(String[i])) {
				res7.setInstrument("String");
				res7.setDetail(instrument.getDetail());
				logger.info("악기 확인 : {}",res7);
				return res7;
			}
		}
		
		return null;
	}

	@Override
	public List<Tag> getTagScapeforInst(Tag instrument) {
		return sourceDao.selectScapeByInstDetail(instrument);
	}

	@Override
	public List<Tag> getTagFxforInst(Tag instrument) {
		return sourceDao.selectFxByInstDetail(instrument);
	}

	@Override
	public List<Tag> getTagDetailforInst(Tag instrument) {
		return sourceDao.selectDetailByInst(instrument);
	}

	@Override
	public List<Map<String, Object>> getSourceByInstDetail(Tag instrument, HttpSession session) {
		
		Map<String, Object> list = new HashMap();
		
		if( instrument.getGenre() != null ) {
			
			logger.info("Genre 로 들어옴");
			list.put("genre", instrument.getGenre());
			list.put("instrument", instrument.getInstrument());
			list.put("userNo", session.getAttribute("userNo"));
			list.put("detail", instrument.getDetail());
			
		} else if( instrument.getScape() != null) {
			
			logger.info("이젠 scape 로 들어옴");
			list.put("detail", instrument.getDetail());
			list.put("userNo", session.getAttribute("userNo"));
			list.put("instrument", instrument.getInstrument());
			list.put("scape", instrument.getScape());
			
		} else if ( instrument.getFx() != null) {
			
			logger.info("이젠 Fx 로 들어옴");
			list.put("fx", instrument.getFx());
			list.put("userNo", session.getAttribute("userNo"));
			list.put("instrument", instrument.getInstrument());
			list.put("detail", instrument.getDetail());
			
		} else if ( instrument.getInstrument() != null && instrument.getDetail() != null) {
			
			logger.info("detail 분류에서 태그 선택한 경우");
			list.put("userNo", session.getAttribute("userNo"));
			list.put("instrument", instrument.getInstrument());
			list.put("detail", instrument.getDetail());
			list.put("scape", instrument.getScape());
			list.put("fx", instrument.getFx());
			list.put("genre", instrument.getGenre());
			
		}
		
		list.put("instrument", instrument.getInstrument());
		list.put("userNo", session.getAttribute("userNo"));
		
		logger.info("inst Tag : {} ", instrument);
		
		return sourceDao.selectSourceByInstDetail(list);
	}

	@Override
	public List<Map<String, Object>> getPack() {
		return sourceDao.selectPackForSound();
	}

	@Override
	public List<Map<String, Object>> getLikePack() {
		return sourceDao.selectLikePackForSound();
	}

	@Override
	public List<Map<String, Object>> getPackByPackNo(int packNo, Tag tag) {
		
		// 재사용성을 위한 Map 사용
		Map<String, Object> list = new HashMap<String, Object>();
		
		list.put("packNo", packNo);
		list.put("genre", tag.getGenre());
		list.put("instrument", tag.getInstrument());
		list.put("detail", tag.getDetail());
		list.put("scape", tag.getScape());
		list.put("fx", tag.getFx());
		
		return sourceDao.selectPackByPackNo(list);
	}

	@Override
	public Map<String, Object> getPackInfo(int packNo) {
		return sourceDao.selectPackInfoByPackNo(packNo);
	}

	@Override
	public List<Map<String, Object>> getTagGenreForPack(int packNo) {
		return sourceDao.selectPackGenreByPackNo(packNo);
	}

	@Override
	public List<Map<String, Object>> getTagInstForPack(int packNo) {
		return sourceDao.selectPackInstByPackNo(packNo);
	}

	@Override
	public List<Map<String, Object>> getTagDetailForPack(int packNo) {
		return sourceDao.selectPackDetailByPackNo(packNo);
	}

	@Override
	public List<Map<String, Object>> getTagScapeForPack(int packNo) {
		return sourceDao.selectPackScapeByPackNo(packNo);
	}

	@Override
	public List<Map<String, Object>> getTagFxForPack(int packNo) {
		return sourceDao.selectPackFxByPackNo(packNo);
	}

	@Override
	public boolean chkPackLike(PackLike like) {
		
		int chk = sourceDao.selectByPackLike(like);
		
		if( chk <= 0) {
			return false;
		} else {
			return true;
		}
		
	}

	@Override
	public void packDestLike(PackLike like) {
		sourceDao.deleteByPackLike(like);
	}

	@Override
	public void packLike(PackLike like) {
		sourceDao.insertPackLike(like);
	}

	@Override
	public boolean tracePackLike(HttpSession session, Pack pack) {
		
		PackLike like = new PackLike();
		like.setUserNo((int)session.getAttribute("userNo"));
		like.setPackNo(pack.getPackNo());
		
		int res = sourceDao.selectByPackLike(like);
		logger.info("res 결과 값 {}",res);
		
		
		if(res <= 0) {
			return false;
		} else if(res > 0) {
			return true;
		}
		
		return false;
	}

	@Override
	public int getPackLikeCnt(PackLike like) {
		return sourceDao.selectPackLikeCnt(like);
	}

	@Override
	public List<Map<String, Object>> getPackInfos(Tag tag) {
		return sourceDao.selectPackInfos(tag);
	}

	@Override
	public List<Tag> getPackTag(Tag tag) {
		return sourceDao.selectTagByGenre(tag);
	}

	@Override
	public List<Tag> getPackInfosInst(Tag tag) {
		return sourceDao.selectTagByInstDetail(tag);
	}

	@Override
	public List<Map<String, Object>> getMySource(int userNo) {
		return sourceDao.selectMySourcebyUserNo(userNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
