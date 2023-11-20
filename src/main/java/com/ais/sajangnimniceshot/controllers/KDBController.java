package com.ais.sajangnimniceshot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.services.Authentication;
import com.ais.sajangnimniceshot.services.KDBService;

@Controller
public class KDBController {
	@Autowired
	private KDBService service;

	@Autowired
	private Authentication auth;

	@GetMapping("/moveMyPage")
	public ModelAndView moveMyPage(ModelAndView mav) {
		mav.setViewName("myPage");
		this.service.backController("moveMyPage", mav);
		this.auth.backController("changeHeader", mav);
		return mav;
	}

	@GetMapping("/moveReservedDetail/{rsvCode}")
	public ModelAndView moveReservedDetail(ModelAndView mav, @PathVariable("rsvCode") String rsvCode) {
		mav.setViewName("reservedDetail");
		mav.addObject("rsvCode", rsvCode);
		this.service.backController("moveReservedDetail", mav);
		this.auth.backController("changeHeader", mav);
		return mav;
	}

	@GetMapping("/moveReservedTransfer/{rsvCode}")
	public ModelAndView moveReservedTransfer(ModelAndView mav, @PathVariable("rsvCode") String rsvCode) {
		mav.setViewName("reservedTransfer");
		mav.addObject("rsvCode", rsvCode);
		this.service.backController("moveReservedTransfer", mav);
		this.auth.backController("changeHeader", mav);
		return mav;
	}

	@PostMapping("/reservedTransfer/{rsvCode}")
	public ModelAndView reservedTransfer(ModelAndView mav, @PathVariable("rsvCode") String rsvCode,
			@RequestParam("memNickname") String memNickname) {
//		mav.setViewName("redirect:/moveMyPage");
		mav.setViewName("myPage");
		mav.addObject("rsvCode", rsvCode);
		mav.addObject("memNickname", memNickname);
		this.service.backController("reservedTransfer", mav);
		this.auth.backController("changeHeader", mav);
		return mav;
	}
}
