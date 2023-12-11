package com.onpier.LibraryMainService.bean.requests;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BookSearchRequest {

    private String userUUID;
    private String borrowedFrom;
    private String borrowedTo;

}
