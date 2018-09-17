package com.wxl.modules.sys.web;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wxl.common.provider.base.controller.ProviderController;
import com.wxl.common.utils.MatrixUtil;

/**
 * 使用ZXing2.3，生成条码的辅助类。可以编码、解码。编码使用code包，解码需要javase包。
 * 
 * <br/>
 * <br/>
 * 作者：WuXiling<br/>
 * 联系：liangxiaofeng1989@hotmail.com<br/>
 * 时间：2016年6月28日<br/>
 */
@Controller
@RequestMapping(value = "${adminPath}/barZxing")
public class BarcodeZxingController  extends ProviderController{

	/**
	 * 生成条形码
	 * 
	 * <br/>
	 * <br/>
	 * 作者：WuXiling<br/>
	 * 联系：liangxiaofeng1989@hotmail.com<br/>
	 * 时间：2016年6月28日<br/>
	 */
	@RequestMapping(value = {"showBarCode"})
	protected void showBarCode(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String text = request.getParameter("msg");
		if(StringUtils.isNoneBlank(text)){
	        BufferedImage image = MatrixUtil.toBufferedImage(MatrixUtil.toBarCodeMatrix(text, null, null));
	        ImageIO.write(image,"png",response.getOutputStream());
	        response.setContentType("png");
			response.getOutputStream().flush();
		}	
	}
	
	/**
	 * 生成二维码
	 * 
	 * <br/>
	 * <br/>
	 * 作者：WuXiling<br/>
	 * 联系：liangxiaofeng1989@hotmail.com<br/>
	 * 时间：2016年6月28日<br/>
	 */
	@RequestMapping(value = {"showRqcode"})
	protected void showRqcode(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String text = request.getParameter("msg");
		if(StringUtils.isNoneBlank(text)){
			BufferedImage image = MatrixUtil.toBufferedImage(MatrixUtil.toQRCodeMatrix(text, null, null));
			ImageIO.write(image,"png",response.getOutputStream());
			response.setContentType("png");
			response.getOutputStream().flush();
		}
	}

	/* (non-Javadoc)
	 * @see com.wxl.common.provider.base.controller.ProviderController#viewPath()
	 */
	@Override
	protected String viewPath() {
		// TODO Auto-generated method stub
		return null;
	}
}