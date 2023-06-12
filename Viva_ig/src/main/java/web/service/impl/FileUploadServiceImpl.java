package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.FileUploadDao;
import web.dto.Pack;
import web.dto.PackImgInfo;
import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.SourceImgInfo;
import web.dto.Tag;
import web.service.face.FileUploadService;


@Service
public class FileUploadServiceImpl implements FileUploadService{
	
	@Autowired FileUploadDao fileUploadDao;
	
	//파일업로드에 필요한 context
	@Autowired ServletContext context;
	
	//로그객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public List<Map<String, Object>> getSourceList() {
		return fileUploadDao.selectAllSourceList();
	}
	
	@Override
	public List<Map<String, Object>> getPackList() {
		return fileUploadDao.selectAllPackList();
	}
	
	@Override
	public void SourceUpload(Tag tag,Source source,MultipartFile imgfile,MultipartFile file) {
		
		//Tag(instrument,genre,scape,detail,fx)
		fileUploadDao.TagInsert(tag);
		
		source.setTagNo(tag.getTag_no());
		
		//Source (name,BPM,Key,Tag) 정보 insert 
		fileUploadDao.SourceInsertSource(source);
		
		
		//---------------------------------------------------------------------------------------
		//파일 업로드시작 
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//-----------------------------------------------------------------------
		//이부분은 imgfile에 관한 코드입니다 
		//파일이 저장될 이름 - imgfile
		String imgoriginName = imgfile.getOriginalFilename();
		String imgstoredName = imgoriginName + UUID.randomUUID().toString().split("-")[4];
		
		
		//저장될 파일 정보 객체
		File imgdest = new File(storedFolder, imgstoredName);

		try {
			imgfile.transferTo(imgdest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//소스 이미지 imgfile 업로드 부분 
		SourceImgInfo sourceImgInfo = new SourceImgInfo();
		sourceImgInfo.setSourceNo(source.getSourceNo());
		sourceImgInfo.setSourceImgOriginname(imgoriginName);
		sourceImgInfo.setSourceImgStoredname(imgstoredName);
		
		logger.info("***********sourceImgInfo의 sourceno가 들어있는지 : {}",sourceImgInfo);
		fileUploadDao.SourceInsertImg(sourceImgInfo);
		
		//-----------------------------------------------------------------------
		//이부분은 음원file에 관한 코드입니다 
		//파일이 저장될 이름 - file
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일 정보 객체
		File dest = new File(storedFolder, storedName);

		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//소스 음원 file 업로드 부분
		SourceFileInfo sourceFileInfo = new SourceFileInfo();
		sourceFileInfo.setSourceNo(source.getSourceNo());
		sourceFileInfo.setFileOriginname(originName);
		sourceFileInfo.setFileStoredname(storedName);
		sourceFileInfo.setFileSize((int)file.getSize());
		fileUploadDao.SourceInsertFile(sourceFileInfo);
		
	}

	@Override
	public void uploadPack(Tag tag, Pack pack, MultipartFile packImg, Source source, List<MultipartFile> packFileList) {
		
		//Tag(instrument,genre,scape,detail,fx)
		//함수재사용 ( 위에서 sourceupload에서 사용한 함수 ) 
		fileUploadDao.TagInsert(tag);
		
		//tag에서 생성된 tag_no를 pack의 tag_no에 넣어버린다
		pack.setTagNo(tag.getTag_no());
		
		//pack 테이블(no,name,content,date,tagno) insert부분 
		fileUploadDao.packInsert(pack);
		
		//팩이미지파일 packImg 업로드시작 
		//빈 파일일 경우
		if( packImg.getSize() <= 0 ) {
			return;
		}

		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}

		//-----------------------------------------------------------------------
		//이부분은 packImg에 관한 코드입니다 

		//파일이 저장될 이름 - packImg
		String packimgoriginName = packImg.getOriginalFilename();
		String packimgstoredName = packimgoriginName + UUID.randomUUID().toString().split("-")[4];


		//저장될 파일 정보 객체
		File packimgdest = new File(storedFolder, packimgstoredName);

		try {
			packImg.transferTo(packimgdest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//팩이미지 PackImgInfo 업로드 부분 
		PackImgInfo packImgInfo = new PackImgInfo();
		packImgInfo.setPackNo(pack.getPackNo());
		packImgInfo.setPackImgOriginname(packimgoriginName);
		packImgInfo.setPackImgStoredname(packimgstoredName);

		fileUploadDao.PackImgInsert(packImgInfo);
		
		//----------------------------------------------------------------------------
		
		
		//packFileList를 for문으로 돌린다 List이기떄문에 
		for (int i = 0; i < packFileList.size(); i++) {
			
			//pack 의 source 정보 insert(source_no,source_name,bpm,key,source_price,tag_no,pack_no,user_no,source_time)
			source.setTagNo(tag.getTag_no());
			source.setPackNo(pack.getPackNo());
			source.setSourceName(packFileList.get(i).getOriginalFilename());
			fileUploadDao.PackSourceInsert(source);
		
				//빈 파일일 경우
				if( packFileList.get(i).getSize() <= 0) {
					return;
				}
				
				//파일이 저장될 경로
				String storedPath1 = context.getRealPath("upload");
				File storedFolder1 = new File(storedPath1);
				if( !storedFolder1.exists() ) {
					storedFolder1.mkdir();
				}
				
				//-----------------------------------------------------------------------
				//이부분은 packFileList(sourcefile이 여러개 인것)에 관한 코드입니다 
				//파일이 저장될 이름 - packFileList
				String packoriginName = packFileList.get(i).getOriginalFilename();
				String packstoredName = packoriginName + UUID.randomUUID().toString().split("-")[4];
				
				
				//저장될 파일 정보 객체
				File packdest = new File(storedFolder1, packstoredName);

				try {
					packFileList.get(i).transferTo(packdest);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				//---------------------------------------------------------------------------
				
				//소스 음원 file 업로드 부분
				SourceFileInfo sourceFileInfo = new SourceFileInfo();
				sourceFileInfo.setSourceNo(source.getSourceNo());
				sourceFileInfo.setFileOriginname(packoriginName);
				sourceFileInfo.setFileStoredname(packstoredName);
				sourceFileInfo.setFileSize((int)packFileList.get(i).getSize());
				fileUploadDao.SourceInsertFile(sourceFileInfo);
				
		}//for문 끝 
		
		
		
	}

	

}
