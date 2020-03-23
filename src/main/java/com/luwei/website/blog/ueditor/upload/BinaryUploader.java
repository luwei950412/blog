package com.luwei.website.blog.ueditor.upload;



import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.luwei.website.blog.ueditor.PathFormat;
import com.luwei.website.blog.ueditor.define.AppInfo;
import com.luwei.website.blog.ueditor.define.BaseState;
import com.luwei.website.blog.ueditor.define.FileType;
import com.luwei.website.blog.ueditor.define.State;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class BinaryUploader {

	public static final State save(HttpServletRequest request,
								   Map<String, Object> conf) {
		FileItemStream fileStream = null;
		boolean isAjaxUpload = request.getHeader( "X_Requested_With" ) != null;
		if (!ServletFileUpload.isMultipartContent(request)) {
			return new BaseState(false, AppInfo.NOT_MULTIPART_CONTENT);
		}
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile multipartFile = multipartRequest.getFile(conf.get("fieldName").toString());
			if(multipartFile==null){
				return new BaseState(false, AppInfo.NOTFOUND_UPLOAD_DATA);
			}
			String savePath = (String) conf.get("savePath");
			String originFileName = multipartFile.getOriginalFilename();
			String suffix = FileType.getSuffixByFilename(originFileName);
			originFileName = originFileName.substring(0, originFileName.length() - suffix.length());
			savePath = savePath + suffix;
			long maxSize = (Long) conf.get("maxSize");
			if (!validType(suffix, (String[]) conf.get("allowFiles"))) {
				return new BaseState(false, AppInfo.NOT_ALLOW_FILE_TYPE);
			}
			savePath = PathFormat.parse(savePath, originFileName);
			//String physicalPath = (String) conf.get("rootPath") + savePath;
			String  basePath= (String) conf.get("basePath");
			String  physicalPath=basePath+savePath;

			InputStream is = multipartFile.getInputStream();
			State storageState = StorageManager.saveFileByInputStream(is, physicalPath, maxSize);
			is.close();
			if (storageState.isSuccess()) {
				storageState.putInfo("url", PathFormat.format(savePath));
				storageState.putInfo("type", suffix);
				storageState.putInfo("original", originFileName + suffix);
			}
			return storageState;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new BaseState(false, AppInfo.IO_ERROR);
	}

	private static boolean validType(String type, String[] allowTypes) {
		List<String> list = Arrays.asList(allowTypes);

		return list.contains(type);
	}
}
