//
//  Constants.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 18/1/24.
//

import Foundation

public struct Constants {
    public static let serverURL: String = "https://localhost:8000"
    
    private static let transactionsPath: String = "/transactions"
    private static let usersTOPath: String = "/usersTO"
    private static let exercisesTOPath: String = "/exercisesTO"
    private static let routinesTOPath: String = "/routinesTO"
    private static let usersPath: String = "/users"
    private static let postsPath: String = "/posts"
    private static let commentsPath: String = "/comments"
    private static let routinesPath: String = "/routines"

    enum URL {
        /// `TRANSACTIONS`
        static let endpointLogin: String = transactionsPath + "/login"
        static let endpointRegister: String = transactionsPath + "/register"
        
        /// `USERS_TO`
        static let endpointGetUsersTO: String = usersTOPath + "/"
        static let endpointGetUserTOById: String = usersTOPath + "/" //{id}
        static let endpointGetUserTOByUsername: String = usersTOPath + "/username/" //{username}
        static let endpointUpdateUserTO: String = usersTOPath + "/"
        static let endpointDeleteUserTO: String = usersTOPath + "/" //{id}
        
        /// `EXERCISES_TO`
        static let endpointGetExercisesTO: String = exercisesTOPath + "/"
        static let endpointGetExerciseTOById: String = exercisesTOPath + "/" //{id}
        static let endpointGetExerciseTOByName: String = exercisesTOPath + "/exerciseName/" //{name}
        static let endpointGetExercisesTOByCreator: String = exercisesTOPath + "/creator/" //{creator}
        static let endpointAddExerciseTO: String = exercisesTOPath + "/"
        static let endpointUpdateExerciseTO: String = exercisesTOPath + "/"
        static let endpointDeleteExerciseTO: String = exercisesTOPath + "/" //{id}
        
        /// `ROUTINES_TO`
        static let endpointGetRoutinesTO: String = routinesTOPath + "/"
        static let endpointGetRoutineTOById: String = routinesTOPath + "/" //{id}
        static let endpointGetRoutineTOByName: String = routinesTOPath + "/routineName/" //{name}
        static let endpointGetRoutinesTOByCreator: String = routinesTOPath + "/creator/" //{creator}
        static let endpointAddRoutineTO: String = routinesTOPath + "/"
        static let endpointAddExerciseToRoutineTO: String = routinesTOPath + "/" //{routineId}_{exerciseId}
        static let endpointUpdateRoutineTO: String = routinesTOPath + "/"
        static let endpointDeleteRoutineTO: String = routinesTOPath + "/" //{id}
        
        /// `USERS`
        static let endpointGetUsers: String = usersPath + "/"
        static let endpointGetUserById: String = usersPath + "/" //{id}
        static let endpointGetUserByUsername: String = usersPath + "/username/" //{username}
        static let endpointUpdateUser: String = usersPath + "/"
        static let endpointDeleteUser: String = usersPath + "/" //{id}
        static let endpointDeleteAllUsers: String = usersPath + "/"
        static let endpointGetPublicUsers: String = usersPath + "/" //{attribute}/{value}
        static let endpointFollowUser: String = usersPath + "/" //{follower}/{followed}
        static let endpointUnfollowUser: String = usersPath + "/" //{follower}/{unfollowed}
        
        /// `POSTS`
        static let endpointGetPosts: String = postsPath + "/"
        static let endpointGetPostById: String = postsPath + "/" //{id}
        static let endpointGetPostsByCreator: String = postsPath + "/creator/" //{creator}
        static let endpointAddPost: String = postsPath + "/"
        static let endpointUpdatePost: String = postsPath + "/"
        static let endpointDeletePost: String = postsPath + "/" //{id}
        static let endpointDeleteAllCreatorPosts: String = postsPath + "/creatorPosts/" //{creator}
        
        /// `COMMENTS`
        static let endpointGetComments: String = commentsPath + "/"
        static let endpointGetCommentById: String = commentsPath + "/" //{id}
        static let endpointGetCommentsByCreator: String = commentsPath + "/creator/" //{creator}
        static let endpointGetPostComments: String = commentsPath + "/post/" //{postId}
        static let endpointAddCommentToPost: String = commentsPath + "/post/" //{postId}
        static let endpointUpdateCommentFromPost: String = commentsPath + "/post/" //{postId}
        static let endpointDeleteCommentFromPost: String = commentsPath + "/post/" //{postId}/comment/{commentId}
        static let endpointDeleteAllPostComments: String = commentsPath + "/postComments/" //{postId}
        
        /// `ROUTINES`
        static let endpointGetRoutines: String = routinesPath + "/"
        static let endpointGetRoutineById: String = routinesPath + "/" //{id}
        static let endpointGetRoutinesByCreator: String = routinesPath + "/creator/" //{creator}
        static let endpointAddRoutine: String = routinesPath + "/"
        static let endpointUpdateRoutine: String = routinesPath + "/"
        static let endpointDeleteRoutine: String = routinesPath + "/" //{id}
        static let endpointDeleteAllCreatorRoutines: String = routinesPath + "/creatorRoutines/" //{creator}
    }
}

